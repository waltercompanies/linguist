defmodule Linguist.Cldr do
  use Cldr,
    locales: ["en", "nl"],
    default_locale: "nl",
    providers: [Cldr.Number, Cldr.DateTime, Cldr.List, Cldr.Territory, Cldr.Unit]
end
