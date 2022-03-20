import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "@fortawesome/fontawesome-free/js/all"
import "chartkick/chart.js"
import "admin-lte/dist/js/adminlte"
import "../stylesheets/admin.scss"

Rails.start()
Turbolinks.start()
ActiveStorage.start()