#' Read in Fantasy Premier League Data
#'
#' Read in the weekly-updated Fantasy Premier League football data from the
#' GitHub repository \href{https://github.com/andrewl776/fplmodels}{fplmodels}.
#'
#' This data contains a large variety of information on players and their
#' current attributes on
#' \href{https://fantasy.premierleague.com/}{Fantasy Premier League}. In particular, it contains a
#' next_gw_points (next gameweek points) value for each player given their
#' attributes in the current week. Rows represent player-gameweeks, i.e. for
#' each player there is a row for each gameweek. This makes the data suitable
#' for modelling a player's next gameweek points, given attributes such as
#' form, total points, and cost at the current gameweek. This data can
#' therefore be used to create Fantasy Premier League bots that may use a
#' machine learning algorithm and a linear programming solver (for example)
#' to return the best possible transfers and team to pick for each gameweek,
#' thereby fully automating the decision making process in Fantasy Premier
#' League. This function simply supplies the required data for such a task.
#'
#' @return A dataframe (tibble).
#' @export
#'
#' @examples \donttest{
#'
#' library(dplyr)
#'
#' fpl_data <- FPLdata()
#'
#' head(fpl_data)
#'
#' fpl_data %>%
#'   group_by(web_name) %>%
#'   summarise("mean_next_gw_points" = mean(next_gw_points, na.rm = TRUE)) %>%
#'   arrange(-mean_next_gw_points)
#'}
#'
FPLdata <- function() {
  readr::read_csv("https://raw.githubusercontent.com/andrewl776/fplmodels/master/data/players_by_gameweek_csv.csv")
}
