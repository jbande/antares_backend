/**
 * Created by bande on 18/06/20.
 */


var static_texts_app = new Vue({
    el: '#static_texts',
    data: {
        static_texts: [
            { text: 'Learn JavaScript' }
        ],
        new_static_text:{
            language:'',
            pagePosition:'',
            text:''
        }
    },
    created: function () {
        var static_text_query = `query{
		allStaticTexts{
		id
		text
		language
		pagePosition}}`;

        var cdata = {"query": static_text_query, "variables":null};

        $.ajax(
            {type:"POST",
            url:"http://localhost:3444/graphql",
            data:cdata,
            success: (data) => {
                var static_ar = data['data']['allStaticTexts'];

                static_ar.forEach(function(value){
                   value['editing'] = false;
                });

                this.static_texts = static_ar;
            }
        });
    },

    methods: {

        activateEdition: function (static_text) {
            static_text.editing = true;
        },

        updateStaticText: function (static_text) {
            console.log(static_text);

            var static_text_query = `mutation ($id:Int!, $pagePosition:String!, $language:String!, $text:String) {
                updateStaticText(
                    id: $id
                    pagePosition: $pagePosition
                    language: $language
                    text:$text
                ){
                id
                pagePosition
                language
                text
              }
            }`;

            var variables = {
                id:parseInt(static_text.id),
                pagePosition:static_text.pagePosition,
                language:static_text.language,
                text:static_text.text
            };

            var cdata = {query: static_text_query, variables:variables};

            $.ajax(
                {type:"POST",
                    url:"http://localhost:3444/graphql",
                    data:JSON.stringify(cdata),
                    success: (data) => {
                        var static_ar = data['data'];
                        console.log(static_ar)
                    },
                    contentType: 'application/json',
            });

            static_text.editing = false;
        },

        saveStaticText: function (new_static_text) {

            var static_text_query = `mutation ($pagePosition:String!, $language:String!, $text:String) {
                createStaticText(
                    pagePosition: $pagePosition
                    language: $language
                    text:$text
                ){
                id
                pagePosition
                language
                text
              }
            }`;

            var variables = {
                pagePosition:new_static_text.pagePosition,
                language:new_static_text.language,
                text:new_static_text.text
            };

            var cdata = {query: static_text_query, variables:variables};

            $.ajax(
                {type:"POST",
                    url:"http://localhost:3444/graphql",
                    data:JSON.stringify(cdata),
                    success: (data) => {
                        var static_ar = data['data']['createStaticText'];
                        this.static_texts.push(static_ar)
                    },
                    contentType: 'application/json',
            });
        },
    }

});