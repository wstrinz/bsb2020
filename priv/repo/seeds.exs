# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bsb.Repo.insert!(%Bsb.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Bsb.Repo.insert!(%Bsb.Soup.Story{
  title: "Title",
  read: false,
  content: "<h3>Content</h3>",
  summary: "Summary",
  score: 99.0,
  url: "http://bsb.stri.nz"
})
