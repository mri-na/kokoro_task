import { Turbo } from "@hotwired/turbo-rails";
import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-loading";
import Rails from "@rails/ujs";
import "form_steps";

Rails.start();

// Turbo を有効化（ページ遷移やフォーム送信を高速化）
Turbo.start();

// Stimulus を有効化（カスタム JavaScript の実行）
const application = Application.start();
const context = require.context("controllers", true, /\.js$/);
application.load(definitionsFromContext(context));
