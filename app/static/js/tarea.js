axios.defaults.baseURL = window.location.href;

var app = new Vue({
	el: '#app',
	delimiters: [ '${', '}' ],
	data: {
		errors: { tarea: {} },
		tarea: {},
	},
	methods: {
		init: function () {
			axios.post('').then(response => {
				this.tarea = response.data;
			})
			.catch(error => { mostrarError(error.response.data); })
		},
		verAdjunto: function () {
			cargando();
			axios.get(`ver-adjunto`, { responseType: 'arraybuffer' }).then(function (response) {
				cerrarCargando();

				var blob = new Blob([ response.data ], { type: response.headers['content-type'] + '; charset=UTF-8' });
				var a = document.createElement('a');
				a.href = URL.createObjectURL(blob);
				a.download = response.headers['content-disposition'].split('filename="')[1].slice(0, -1);
				a.click()
			}).catch(function (error) {
				cerrarCargando();

				swal('Error', error.response.data, 'error');
			})
		},
		abrirModalTarea: function () {

		}
	},
	created: function () {
		moment.locale('es');
		this.init();
	}
});