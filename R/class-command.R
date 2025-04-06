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
