const elixir = require('laravel-elixir');

require('laravel-elixir-vue-2');

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir(mix => {
   
    mix.scripts([
    		'./node_modules/chart.js/dist',

    	]);
    mix.copy(
    		'./node_modules/jquery-ui/ui', 'public/js/'

    	);
});
