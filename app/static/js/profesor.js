axios.defaults.baseURL = 'http://127.0.0.1:8000/profesor';

var app = new Vue({
	el: '#app',
	delimiters: [ '${', '}' ],
	data: {
		curso: {},
		errors: {
			curso: {}
		}
	},
	methods: {
		abrirModalCurso: function () {
			this.curso = {};
			$('#cursoModal').modal('show');
		},
		agregarCurso: function () {
			var vue = this;
			cargando('Registrando...');
			axios.post('registrar-curso', vue.curso).then(function (response) {
				cerrarCargando();

				swal('Exito', 'Curso añadido con exito', 'success');
			}).catch(function (error) {
				cerrarCargando();

				if (error.response.status == 422) vue.errors.curso = error.response.data;
				else mostrarError(error.response.data);
			});
		}
	}
});