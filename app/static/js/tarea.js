axios.defaults.baseURL = window.location.href;

var app = new Vue({
	el: '#app',
	delimiters: [ '${', '}' ],
	data: {
		errors: { tarea: {}, tarea_form: {} },
		tarea: {},
		tarea_form: {}
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

				fileResponse(response);
			})
			.catch(function (error) {
				cerrarCargando();
				swal('Error', error.response.data, 'error');
			})
		},
		abrirModalTarea: function () {
			this.tarea_form = JSON.parse(JSON.stringify(this.tarea));
			$('#tareaModal').modal('show');
		},
		guardarTarea: function () {
			cargando();
			axios.post('guardar', objectToFormData(this.tarea_form)).then(response => {
				cerrarCargando();

				swal('Exito', response.data, 'success');
			})
			.catch(error => {
				cerrarCargando();
				if (error.status != 422) mostrarError(response.data);
			})
		}
	},
	created: function () {
		moment.locale('es');
		this.init();
	}
});