axios.defaults.baseURL = 'http://127.0.0.1:8000/';
axios.defaults.xsrfCookieName = 'csrftoken';
axios.defaults.xsrfHeaderName = 'X-CSRFToken';

function cargando (text = 'Cargando...') {
	swal({
		text: text,
		button: false,
		closeOnClickOutside: false,
		closeOnEsc: false
	});
}

function cerrarCargando () {
	swal.close();
}

function mostrarError (data) {
	var titulo = data.split('<h1>')[1].split('</h1>')[0];
	var texto = data.split('<pre class="exception_value">')[1].split('</pre>')[0];

	var div = document.createElement('DIV');

	div.innerHTML = titulo;
	titulo = div.innerText;

	div.innerHTML = texto;
	texto = div.innerHTML;
	
	swal(titulo, texto, 'error');
}

function actualizar () {
	window.location.href = window.location.href;
}