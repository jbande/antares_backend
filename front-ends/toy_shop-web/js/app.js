
var simage = {
	id:'',
	pagePosition:'',
	images:[
		{
			id:'',
			original:'',
			v100100:''
		}
	]
};

var stext = {
	id:'',
	pagePosition:'',
	text:''
};


var text_locations = {
	hometab: stext,
	abouttab: stext,
	mailto: stext,
	contactphone: stext,
	sitetittle:stext,
	servicetab: stext,
	heading1: stext,
	heading11:stext,
	pane6: simage,
	heading1text:stext,
	image78:simage,
	bp_img_3:simage,
    image2:simage
};

var app6 = new Vue({
	el: '#home',
	data: text_locations,
	created: function () {

		const static_text_query = `query{
		allStaticTexts{
		id
		text
		language
		pagePosition}}`;

		var text_query = {"query": static_text_query, "variables":null};

		$.ajax({type:"POST",
			url:"http://localhost:3444/graphql",
			data:text_query,
			success: (data) => {

				const text_list = data['data']['allStaticTexts'];

				var app_keys = Object.keys(this.$data);

				var app_len = app_keys.length;

				for (var i = 0; i < app_len; i++) {
					var value = app_keys[i];
					var text_val = text_list.find(element => element.pagePosition == value);
					if (text_val){
						this[value] = text_val;
					}
				}
			}});


		const static_images_query = `query{
        allStaticImages{    
        id    
        images{
        id
        original
        v100100
        }    
        pagePosition
        }}`;

		var image_query = {"query": static_images_query,
			"variables":null};

		$.ajax({type:"POST",
			url:"http://localhost:3444/graphql",
			data:image_query,
			success: (data) => {

				const images_list = data['data']['allStaticImages'];

				var app_keys = Object.keys(this.$data);

				var app_len = app_keys.length;

				for (var i = 0; i < app_len; i++) {
					var value = app_keys[i];
					var image_val = images_list.find(element => element.pagePosition == value);

					if (image_val) {
						this[value] = image_val["images"][0]
					}
				}
			}
		});
	}
});
