module MingleHelpers
  module Regex
    LIST_PROJECTS_PATTERN = /([mM]ingle [pP]rojects?)/
    CREATE_CARD_PATTERN   = /([mM]ingle)\s+(?<project>\w+)\s+(?<card_type>[\w\s]+)\swith\sname\s(?<name>.*)/
    UPDATE_CARD_PATTERN   = /([mM]ingle)\s(?<project>\S+)\s(?<card_num>\d+)\s(?<description>.+)/m
  end
end
