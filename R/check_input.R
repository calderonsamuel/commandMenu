check_input <- S7::new_generic("check_input", "x")

S7::method(check_input, class_shiny.tag) <- function(x, command_menu) {
  tq <- htmltools::tagQuery(x)
  is_textarea_input <- tq$children("textarea.shiny-input-textarea")$length() == 1L
  if (is_textarea_input) return()

  tq$resetSelected()
  is_text_input <- tq$children("input.shiny-input-text")$length() == 1L
  if (is_text_input) return()

  stop("Element should be a textInput or textAreaInput", call. = FALSE)
}
