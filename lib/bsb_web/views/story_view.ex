defmodule BsbWeb.StoryView do
  use BsbWeb, :view
  alias BsbWeb.StoryView

  def render("index.json", %{stories: stories}) do
    %{data: render_many(stories, StoryView, "story.json")}
  end

  def render("show.json", %{story: story}) do
    %{data: render_one(story, StoryView, "story.json")}
  end

  def render("story.json", %{story: story}) do
    %{id: story.id,
      title: story.title,
      content: story.content,
      score: story.score,
      summary: story.summary,
      url: story.url,
      read: story.read}
  end
end
