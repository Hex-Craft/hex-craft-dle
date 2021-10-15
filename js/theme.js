var icon = document.getElementById("theme-icon");
var theme = 0;

function applyTheme(theme) {
	document.body.classList.remove("theme-light", "theme-dark");
	document.body.classList.add(theme);
}

$('#theme_checkbox').on('click', function(){
	icon.classList.toggle('theme-icon');

	if (icon.classList.contains('fa-sun') || localStorage.getItem("theme") == 'theme-light') {
		$('#theme_checkbox').prop('checked', true);
		icon.classList.remove('fa-sun');
		icon.classList.add('fa-moon');
		applyTheme('theme-dark');
		localStorage.setItem("theme", 'theme-dark');
		theme = 1;
	} else {
		icon.classList.add('fa-sun');
		icon.classList.remove('fa-moon');
		applyTheme('theme-light');
		localStorage.setItem("theme", 'theme-light');
		theme = 0;
	}
	initializeViewer(theme);
	setTimeout(function (){ icon.classList.remove('theme-icon'); }, 500);

});

document.addEventListener("DOMContentLoaded", () => {

	if (localStorage.getItem("theme") == 'theme-dark') {
		$('#theme_checkbox').prop('checked', true);
		theme = 1;
		skinViewer.dispose();
		orbitControl.dispose();
		initializeViewer(theme);
		icon.classList.remove('fa-sun');
		icon.classList.add('fa-moon');
	}
});