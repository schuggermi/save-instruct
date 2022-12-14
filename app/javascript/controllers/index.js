// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddStepController from "./add_step_controller"
application.register("add-step", AddStepController)

import EditStepController from "./edit_step_controller"
application.register("edit-step", EditStepController)

import EmployeeController from "./employee_controller"
application.register("employee", EmployeeController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MarkDoneController from "./mark_done_controller"
application.register("mark-done", MarkDoneController)

import NfcController from "./nfc_controller"
application.register("nfc", NfcController)

import OrderByDragController from "./order_by_drag_controller"
application.register("order-by-drag", OrderByDragController)

import NestedForm from 'stimulus-rails-nested-form'
application.register('nested-form', NestedForm)

import SearchItemsController from "./search_items_controller"
application.register("search-items", SearchItemsController)

import SelectAllController from "./select_all_controller"
application.register("select-all", SelectAllController)
