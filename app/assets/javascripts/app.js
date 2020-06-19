
var text_locations = {
    hometab: '',
    abouttab: '',
    mailto: '',
    contactphone: '',
    sitetittle:'',
    servicetab: '',
    heading1: '',
    heading11:'',
    pane6: 'images/a1.jpg'
};

var app6 = new Vue({
    el: '#home',
    data: text_locations,
    created: function () {

        var static_text_query = `query{
		allStaticTexts{
		id
		text
		language
		pagePosition}}`;

        var cdata = {"query": static_text_query, "variables":null};

        $.ajax({type:"POST",
            url:"http://localhost:3444/graphql",
            data:cdata,
            success: (data) => {

                const text_list = data['data']['allStaticTexts'];

                app_keys = Object.keys(this.$data);

                app_len = app_keys.length;
                for (var i = 0; i < app_len; i++) {
                    var value = app_keys[i];
                    var text_val = text_list.find(element => element.pagePosition == value);
                    if (text_val){
                        //console.log(text_val)
                        //console.log(value)
                        this[value] = text_val.text;
                    }
                }
            }});


        var static_images_query = `query{
			allStaticImages{    
                              id    
                              images{
                                id
                                original
                                v100100
                              }    
                              pagePosition
			}}`

        var cdata = {"query": static_images_query,
            "variables":null};

        $.ajax({type:"POST",
            url:"http://localhost:3444/graphql",
            data:cdata,
            success: (data) => {

                const images_list = data['data']['allStaticImages'];

                app_keys = Object.keys(this.$data);

                app_len = app_keys.length
                for (var i = 0; i < app_len; i++) {
                    var value = app_keys[i]
                    var image_val = images_list.find(element => element.pagePosition == value);
                    if (image_val) {
                        console.log(image_val["images"][0].original);
                        console.log(value);
                        this[value] = image_val["images"][0].original
                    }
                    //this[value] = text_val.text;
                }
            }});

    }
});
