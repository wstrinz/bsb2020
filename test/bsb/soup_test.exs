defmodule Bsb.SoupTest do
  use Bsb.DataCase

  alias Bsb.Soup

  describe "stories" do
    alias Bsb.Soup.Story

    @valid_attrs %{content: "some content", read: true, score: 120.5, summary: "some summary", title: "some title", url: "some url"}
    @update_attrs %{content: "some updated content", read: false, score: 456.7, summary: "some updated summary", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{content: nil, read: nil, score: nil, summary: nil, title: nil, url: nil}

    def story_fixture(attrs \\ %{}) do
      {:ok, story} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Soup.create_story()

      story
    end

    test "list_stories/0 returns all stories" do
      story = story_fixture()
      assert Soup.list_stories() == [story]
    end

    test "get_story!/1 returns the story with given id" do
      story = story_fixture()
      assert Soup.get_story!(story.id) == story
    end

    test "create_story/1 with valid data creates a story" do
      assert {:ok, %Story{} = story} = Soup.create_story(@valid_attrs)
      assert story.content == "some content"
      assert story.read == true
      assert story.score == 120.5
      assert story.summary == "some summary"
      assert story.title == "some title"
      assert story.url == "some url"
    end

    test "create_story/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Soup.create_story(@invalid_attrs)
    end

    test "update_story/2 with valid data updates the story" do
      story = story_fixture()
      assert {:ok, %Story{} = story} = Soup.update_story(story, @update_attrs)
      assert story.content == "some updated content"
      assert story.read == false
      assert story.score == 456.7
      assert story.summary == "some updated summary"
      assert story.title == "some updated title"
      assert story.url == "some updated url"
    end

    test "update_story/2 with invalid data returns error changeset" do
      story = story_fixture()
      assert {:error, %Ecto.Changeset{}} = Soup.update_story(story, @invalid_attrs)
      assert story == Soup.get_story!(story.id)
    end

    test "delete_story/1 deletes the story" do
      story = story_fixture()
      assert {:ok, %Story{}} = Soup.delete_story(story)
      assert_raise Ecto.NoResultsError, fn -> Soup.get_story!(story.id) end
    end

    test "change_story/1 returns a story changeset" do
      story = story_fixture()
      assert %Ecto.Changeset{} = Soup.change_story(story)
    end
  end
end
