class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  skip_before_action :verify_authenticity_token

  #protect_from_forgery with: :null_session
  include UsersHelper::Access

  def execute

    variables = ensure_hash(params[:variables])

    # This is because when using ajax call ints are converted to strings
    query = params[:query]
    operation_name = params[:operationName]

    cur_user = get_current_user

    context = {
      # Query context goes here, for example:
      # current_user: current_user,
      session: session,
      current_user: cur_user
    }
    result = GraphqlTutorialSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  # def get_current_user
  #   cur_user = current_user
  #   unless cur_user
  #     cur_user = api_current_user
  #   end
  #   return
  # end
  #
  # def api_current_user
  #
  #   return unless request.headers.key? 'token'
  #   return if request.headers['token'].blank?
  #   return if request.headers['token'] == 'null'
  #
  #   crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
  #   token = crypt.decrypt_and_verify request.headers['token']
  #
  #   user_id = token.gsub('user-id:', '').to_i
  #   User.find user_id
  # rescue ActiveSupport::MessageVerifier::InvalidSignature
  #   nil
  # end
  #
  # def current_user
  #
  #   return unless session[:token]
  #
  #   crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
  #   token = crypt.decrypt_and_verify session[:token]
  #
  #   user_id = token.gsub('user-id:', '').to_i
  #   User.find user_id
  # rescue ActiveSupport::MessageVerifier::InvalidSignature
  #   nil
  # end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
