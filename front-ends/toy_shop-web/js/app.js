
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
	heading1text:stext,
	heading2:stext,
	heading3:stext,
	heading4:stext,
	heading5:stext,
	heading55:stext,
	aboutrevelshort:stext,
	address1: stext,
	address2: stext

};

var images_locations = {
	pane6: simage,
	image78:simage,
	bp_img_3:simage,
	image2:simage,
	portrait1: simage
};


var app6 = new Vue({
	el: '#home',
	props: {
		shop_id: 'revel2020'
	},
	data: function (){
		return {
			text_locations: text_locations,
			images_locations: images_locations,
			host_url: 'http://172.93.53.135:3444/graphql',
		}
	},
	mounted: function () {

		const static_text_query = `query allStaticText($filter:StaticTextFilter){
		  allStaticTexts(filter:$filter){
			id
			language
			pagePosition
		  }
		}`;

		var filter = {
			filter: {
				uid: this.shop_id
			}
		};

		var text_query = {"query": static_text_query, "variables":filter};

		$.ajax({type:"POST",
			url:this.host_url,
			data:text_query,
			success: (data) => {

				const text_list = data['data']['allStaticTexts'];
				var app_keys = Object.keys(this.text_locations);
				var app_len = app_keys.length;

				for (var i = 0; i < app_len; i++) {
					var value = app_keys[i];
					var text_val = text_list.find(element => element.pagePosition === value);
					if (text_val){
						this.text_locations[value] = text_val;
					}
				}
			}});


		const static_images_query = `query allStaticImages($filter:StaticImageFilter){
		  allStaticImages(filter:$filter){
			id    
				images{
				id
				original
				v100100
				}    
				pagePosition			
		  }
		}`;

		var image_query = {"query": static_images_query,
			"variables":filter};

		$.ajax({type:"POST",
			url:this.host_url,
			data:image_query,
			success: (data) => {

				const images_list = data['data']['allStaticImages'];

				var app_keys = Object.keys(this.images_locations);

				var app_len = app_keys.length;

				for (var i = 0; i < app_len; i++) {
					var value = app_keys[i];
					var image_val = images_list.find(element => element.pagePosition === value);

					if (image_val) {
						this.images_locations[value] = image_val["images"][0]
					}
				}
			}
		});
	}
});
