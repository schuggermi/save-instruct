// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

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

import SearchTasksController from "./search_tasks_controller"
application.register("search-tasks", SearchTasksController)
