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
			this.errors.tarea_form = {};
			$('#tareaModal').modal('show');
		},
		setArchivo: function (e) {
			file = e.target.files[0];

			this.tarea_form.file = file;
			$('#tarea-file-text').val(file ? file.name : 'Selecciona un archivo');
		},
		guardarTarea: function () {
			cargando();
			axios.post('guardar', objectToFormData(this.tarea_form)).then(response => {
				cerrarCargando();
				this.init();
				$('#tareaModal').modal('hide');
				swal('Exito', response.data, 'success');
			})
			.catch(error => {
				cerrarCargando();
				if (error.response.status != 422) mostrarError(error.response.data);
				else this.errors.tarea_form = error.response.data;
			})
		}
	},
	created: function () {
		moment.locale('es');
		this.init();
	}
});