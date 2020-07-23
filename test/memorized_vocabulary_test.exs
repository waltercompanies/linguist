defmodule MemorizedVocabularyTest do
  use ExUnit.Case

  setup do
    Linguist.MemorizedVocabulary.locale("nl", Path.join([__DIR__, "nl.yml"]))
    Linguist.MemorizedVocabulary.locale("fr-FR", Path.join([__DIR__, "fr-FR.yml"]))
    :ok
  end

  test "locales() returns locales" do
    assert ["fr-FR", "nl"] == Linguist.MemorizedVocabulary.locales()
  end

  test "t returns a translation" do
    assert {:ok, "bar"} == Linguist.MemorizedVocabulary.t("nl", "foo")
  end

  test "t interpolates values" do
    assert {:ok, "hallo Michael Westin"} ==
             Linguist.MemorizedVocabulary.t("nl", "flash.notice.hello",
               first: "Michael",
               last: "Westin"
             )
  end

  test "t returns {:error, :no_translation} when translation is missing" do
    assert Linguist.MemorizedVocabulary.t("nl", "flash.not_exists") == {:error, :no_translation}
  end

  test "t! raises NoTranslationError when translation is missing" do
    assert_raise Linguist.NoTranslationError, fn ->
      Linguist.MemorizedVocabulary.t!("nl", "flash.not_exists")
    end
  end

  test "t pluralizes" do
    assert {:ok, "2 appels"} == Linguist.MemorizedVocabulary.t("nl", "apple", count: 2)
  end

  test "t will normalize a locale to format ll-LL" do
    assert {:ok, "Ennui"} == Linguist.MemorizedVocabulary.t("FR-fr", "flash.notice.alert")
  end

  test "t will raise a LocaleError if a malformed locale is passed in" do
    assert_raise Linguist.LocaleError, fn ->
      Linguist.MemorizedVocabulary.t("es-es-es", "flash.notice.alert")
    end

    assert_raise Linguist.LocaleError, fn ->
      Linguist.MemorizedVocabulary.t(nil, "flash.notice.alert")
    end
  end
end
