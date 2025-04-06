command <- S7::new_class(
  name = "command",
  properties = list(
    id = S7::class_character,
    label = S7::class_character,
    icon = NULL | S7::new_S3_class("html")
  )
)

commandMenu <- S7::new_class(
  name = "commandMenu",
  properties = list(
    commands = S7::new_property(
      class = S7::class_list,
      validator = function(value) {
        if (length(value) < 1L) return("Must have at least one <command>")
        are_all_commands <- value |>
          lapply(function(x) S7::S7_inherits(x, command)) |>
          unlist() |>
          all()

        if (!are_all_commands) return("Every element must be a <command>")
      }
    )
  )
)

add_command_menu <- S7::new_generic("add_command_menu", "x")

check_input <- S7::new_generic("check_input", "x")
is_text_input <- S7::new_generic("is_text_input", "x")
is_textarea_input <- S7::new_generic("is_textarea_input", "x")

S7::method(check_input, S7::new_S3_class("shiny.tag")) <- function(x, commandMenu) {
  tq <- htmltools::tagQuery(x)
  if (is_textarea_input(tq)) return()
  tq$resetSelected()
  if (is_text_input(tq)) return()

  stop("Element should be a textInput or textAreaInput")
}

S7::method(is_text_input, S7::new_S3_class("shiny.tag.query")) <- function(x) {
  tq$children("input.shiny-input-text")$length() == 1L
}

S7::method(is_textarea_input, S7::new_S3_class("shiny.tag.query")) <- function(x) {
  tq$children("textarea.shiny-input-textarea")$length() == 1L
}
