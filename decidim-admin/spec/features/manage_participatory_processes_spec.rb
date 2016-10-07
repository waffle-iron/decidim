# frozen_string_literal: true

require "spec_helper"

describe "Manage participatory processes", type: :feature do
  let(:organization) { create(:organization) }
  let(:admin) { create(:user, :admin, :confirmed, organization: organization) }
  let!(:participatory_process) { create(:process, organization: organization) }
  let!(:participatory_process2) { create(:process, organization: organization) }

  before do
    switch_to_host(organization.host)
    login_as admin, scope: :user
    visit decidim_admin.participatory_processes_path
  end

  it "creates a new participatory_process" do
    find(".actions .new").click

    within ".new_participatory_process" do
      fill_in :participatory_process_title, with: "My participatory process"
      fill_in :participatory_process_subtitle, with: "subtitle"
      fill_in :participatory_process_slug, with: "slug"
      fill_in :participatory_process_hashtag, with: "#hashtag"
      fill_in :participatory_process_short_description, with: "short descirption"
      fill_in :participatory_process_description, with: "A longer description"

      find("*[type=submit]").click
    end

    within ".flash" do
      expect(page).to have_content("successfully")
    end

    within "table" do
      expect(page).to have_content("My participatory process")
    end
  end

  it "updates an participatory_process" do
    within find("tr", text: participatory_process.title) do
      click_link "Edit"
    end

    within ".edit_participatory_process" do
      fill_in :participatory_process_title, with: "My new title"

      find("*[type=submit]").click
    end

    within ".flash" do
      expect(page).to have_content("successfully")
    end

    within "table" do
      expect(page).to have_content("My new title")
    end
  end

  it "deletes an participatory_process" do
    within find("tr", text: participatory_process2.title) do
      click_link "Destroy"
    end

    within ".flash" do
      expect(page).to have_content("successfully")
    end

    within "table" do
      expect(page).to_not have_content(participatory_process2.title)
    end
  end
end
