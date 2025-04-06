describe("check_input()", {
  it("throws an error when input is not a shiny.tag", {
    expect_error(check_input(1L), "Can't find method")
    expect_error(check_input(1.0), "Can't find method")
    expect_error(check_input(TRUE), "Can't find method")
    expect_error(check_input("foo"), "Can't find method")
    expect_error(check_input(list()), "Can't find method")
    expect_error(check_input(NULL), "Can't find method")
  })

  it("throws an error whe input is not text or textarea", {
    expect_error(check_input(shiny::numericInput("foo", "bar", 1)), "Element should be a textInput or textAreaInput")
    expect_error(check_input(shiny::selectInput("foo", "bar", 1)), "Element should be a textInput or textAreaInput")
    expect_error(check_input(shiny::checkboxInput("foo", "bar", 1)), "Element should be a textInput or textAreaInput")
    expect_error(check_input(shiny::radioButtons("foo", "bar", 1)), "Element should be a textInput or textAreaInput")
    expect_error(check_input(shiny::actionButton("foo", "bar")), "Element should be a textInput or textAreaInput")
    expect_error(check_input(shiny::actionLink("foo", "bar")), "Element should be a textInput or textAreaInput")
    expect_error(check_input(shiny::dateInput("foo", "bar")), "Element should be a textInput or textAreaInput")
    expect_error(check_input(shiny::dateRangeInput("foo", "bar")), "Element should be a textInput or textAreaInput")
    expect_error(check_input(shiny::sliderInput("foo", "bar", 1, 10, 1)), "Element should be a textInput or textAreaInput")
    expect_error(check_input(shiny::checkboxGroupInput("foo", "bar", 1)), "Element should be a textInput or textAreaInput")
  })
})
