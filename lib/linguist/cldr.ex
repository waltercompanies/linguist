defmodule Linguist.Cldr do
  use Cldr,
    default_locale: "en",
    locales: ["fr", "en", "es"],
    providers: [Cldr.Number, Cldr.DateTime, Cldr.List, Cldr.Territory, Cldr.Unit]
end
