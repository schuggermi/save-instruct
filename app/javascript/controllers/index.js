// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import EditStepController from "./edit_step_controller"
application.register("edit-step", EditStepController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import NfcController from "./nfc_controller"
application.register("nfc", NfcController)

import NestedForm from 'stimulus-rails-nested-form'
application.register('nested-form', NestedForm)
