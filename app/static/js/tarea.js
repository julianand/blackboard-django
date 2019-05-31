axios.defaults.baseURL = window.location.href + '/';

var app = new Vue({
	el: '#app',
	delimeters: [ '${', '}' ],
	data: {
		errors: {}
	},
	methods: {
		init: function () {
			console.log(1)
		}
	},
	created: function () {
		this.init();
	}
});