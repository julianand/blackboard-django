axios.defaults.baseURL = 'http://127.0.0.1:8000/profesor';

var app = new Vue({
	el: '#app',
	delimiters: [ '${', '}' ],
	data: {
		curso: {},
		cursos: [],
		errors: {
			curso: {}
		}
	},
	methods: {
		getCursos: function () {
			var vue = this;
			axios.get('cursos').then(function (response) {
				vue.cursos = response.data;
			});
		},
		abrirModalCurso: function () {
			this.curso = {};
			$('#cursoModal').modal('show');
		},
		agregarCurso: function () {
			var vue = this;
			cargando('Registrando...');
			axios.post('registrar-curso', vue.curso).then(function (response) {
				cerrarCargando();

				vue.getCursos();
				$('#cursoModal').modal('hide');
				swal('Exito', 'Curso añadido con exito', 'success');
			}).catch(function (error) {
				cerrarCargando();

				if (error.response.status == 422) vue.errors.curso = error.response.data;
				else mostrarError(error.response.data);
			});
		}
	},
	created: function () {
		this.getCursos();
	}
});