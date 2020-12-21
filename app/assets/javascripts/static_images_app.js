/**
 * Created by bande on 18/06/20.
 */


var static_images_app = new Vue({
    el: '#static_images',
    data: {
        host_url: 'http://172.93.53.135:3444/graphql',
        static_images: [
            {
                pagePosition: 'Learn JavaScript',
                id:'',
                images:[
                    {
                        original:'',
                        v100100:'',
                        tiny:'',
                        cardH:'',
                        cardV:''
                    }
                ]
            }
        ],
        on_edit_static_image: {
            id: '',
            pagePosition:'yyyy'
        }
    },
    created: function () {
        var static_images_query = `query {
          allStaticImages{
            id
            images {
              original
              v100100
              cardH
              cardV
              tiny
            }
            pagePosition
          }
        }`;

        var cdata = {"query": static_images_query, "variables":null};

        $.ajax(
            {type:"POST",
                url:this.host_url,
                data:cdata,
                success: (data) => {
                    var static_ar = data['data']['allStaticImages'];
                    console.log(static_ar);
                    static_ar.forEach(function(value){
                        value['editing'] = false;
                    });

                    this.static_images = static_ar;
                }
            });
    },

    methods: {

        activateEdition: function (static_image) {
            this.on_edit_static_image.pagePosition = static_image.pagePosition;
            this.on_edit_static_image.id = static_image.id;
            $('#updateImageModal').show();
        },

        closeModal: function (){
            $('#updateImageModal').hide();
        }
    //
    //     updateStaticText: function (static_text) {
    //         console.log(static_text);
    //
    //         var static_text_query = `mutation ($id:Int!, $pagePosition:String!, $language:String!, $text:String) {
    //             updateStaticText(
    //                 id: $id
    //                 pagePosition: $pagePosition
    //                 language: $language
    //                 text:$text
    //             ){
    //             id
    //             pagePosition
    //             language
    //             text
    //           }
    //         }`;
    //
    //         var variables = {
    //             id:parseInt(static_text.id),
    //             pagePosition:static_text.pagePosition,
    //             language:static_text.language,
    //             text:static_text.text
    //         };
    //
    //         var cdata = {query: static_text_query, variables:variables};
    //
    //         $.ajax(
    //             {type:"POST",
    //                 url:"http://localhost:3444/graphql",
    //                 data:JSON.stringify(cdata),
    //                 success: (data) => {
    //                     var static_ar = data['data'];
    //                     console.log(static_ar)
    //                 },
    //                 contentType: 'application/json',
    //             });
    //
    //         static_text.editing = false;
    //     },
    //
    //     saveStaticText: function (new_static_text) {
    //
    //         var static_text_query = `mutation ($pagePosition:String!, $language:String!, $text:String) {
    //             createStaticText(
    //                 pagePosition: $pagePosition
    //                 language: $language
    //                 text:$text
    //             ){
    //             id
    //             pagePosition
    //             language
    //             text
    //           }
    //         }`;
    //
    //         var variables = {
    //             pagePosition:new_static_text.pagePosition,
    //             language:new_static_text.language,
    //             text:new_static_text.text
    //         };
    //
    //         var cdata = {query: static_text_query, variables:variables};
    //
    //         $.ajax(
    //             {type:"POST",
    //                 url:"http://localhost:3444/graphql",
    //                 data:JSON.stringify(cdata),
    //                 success: (data) => {
    //                     var static_ar = data['data']['createStaticText'];
    //                     this.static_texts.push(static_ar)
    //                 },
    //                 contentType: 'application/json',
    //             });
    //     },
    }

});/**
 * Created by bande on 19/06/20.
 */
