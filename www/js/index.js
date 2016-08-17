F7.init();

$(document).ready(function () {
	console.log('document ready');
	indexModule.initPage();
});

var indexViewModel = new Vue({
	el: '#indexViewModel',
	data: {
		todos: [
			{
				text: 'Learn JavaScript'
			},
			{
				text: 'Learn Vue.js'
			},
			{
				text: 'Build Something Awesome'
			}
    ]
	}
})

var indexModule = (function () {
	var param = {

	};

	var initPage = function () {

	};

	return {
		initPage: initPage
	};
})();
