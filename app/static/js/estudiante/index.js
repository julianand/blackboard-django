axios.defaults.baseURL = window.location.href;

var app = new Vue({
	delimiters: [ '${', '}' ],
	el: '#app',
	data: {
		cursos: [],
		filtro: { nombre: '', profesor: '' },
		errors: {},
		forms: {}
	},
	methods: {
		init: function () {
			axios.get('cursos/').then(response => {
				this.cursos = response.data;
			});
		},
		filtroCursos: function (nombre, profesor) {
			return this.cursos.filter(curso => curso.nombre.indexOf(nombre) != -1 && curso.profesor.indexOf(profesor) != -1);
		},
		matricular: function (curso) {
			cargando();
			axios.get('matricular/').then(response => {
				cerrarCargando();
				this.init();
				swal('Matriculado exitosamente', response.data, 'success');
			});
		}
	},
	created: function () {
		this.init();
	}
});