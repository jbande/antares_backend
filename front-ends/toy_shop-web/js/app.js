
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
	serevicetab: stext,
	heading1: stext,
	heading11:stext,
	heading1text:stext,

};

var images_locations = {
	pane6: simage,
	image78:simage,
	bp_img_3:simage,
	image2:simage
};


var app6 = new Vue({
	el: '#home',
	data: function (){
		return {
			text_locations: text_locations,
			images_locations: images_locations,
			host_url: 'http://172.93.53.135:3444/graphql'
		}
	},
	mounted: function () {

		const static_text_query = `query{
		allStaticTexts{
		id
		text
		language
		pagePosition}}`;

		var text_query = {"query": static_text_query, "variables":null};

		$.ajax({type:"POST",
			url:this.host_url,
			data:text_query,
			success: (data) => {

				const text_list = data['data']['allStaticTexts'];
				console.log(text_list);

				var app_keys = Object.keys(this.text_locations);
				console.log(app_keys);

				var app_len = app_keys.length;

				for (var i = 0; i < app_len; i++) {
					var value = app_keys[i];
					var text_val = text_list.find(element => element.pagePosition === value);
					if (text_val){
						this.text_locations[value] = text_val;
					}
					console.log(this.text_locations);
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
			url:this.host_url,
			data:image_query,
			success: (data) => {

				const images_list = data['data']['allStaticImages'];

				var app_keys = Object.keys(this.$data);

				var app_len = app_keys.length;

				for (var i = 0; i < app_len; i++) {
					var value = app_keys[i];
					var image_val = images_list.find(element => element.pagePosition == value);

					if (image_val) {
						this.images_locations[value] = image_val["images"][0]
					}
				}
			}
		});
	}
});
