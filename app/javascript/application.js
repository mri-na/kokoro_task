// app/javascript/packs/application.js
import "./form_steps"; // form_steps.jsをインポート
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import { Turbo } from "@hotwired/turbo-rails";

const application = Application.start();
const context = require.context("./controllers", true, /.js$/);
application.load(definitionsFromContext(context));

import { Turbo } from "@hotwired/turbo-rails"; // Turboを利用する場合

