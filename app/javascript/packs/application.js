// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

const jQuery = require("jquery")
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

import 'bootstrap'
import 'select2/dist/js/select2.full.js'
import '@fortawesome/fontawesome-free/js/all'
import '../src/application.scss'
import '../custom/click_row'
import './bootstrap_custom'
