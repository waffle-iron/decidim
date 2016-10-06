# frozen_string_literal: true
require_dependency "decidim/admin/application_controller"

module Decidim
  module Admin
    # Controller that allows managing all the Admins.
    #
    class ParticipatoryProcessesController < ApplicationController
      def index
        @participatory_processes = ParticipatoryProcess.all
      end

      def new
        @form = ParticipatoryProcessForm.new
      end

      def create
        @form = ParticipatoryProcessForm.from_params(params)

        CreateParticipatoryProcess.call(@form, organization) do
          on(:ok) do
            flash[:notice] = I18n.t("participatory_processes.create.success", scope: "decidim.admin")
            redirect_to participatory_processes_path
          end

          on(:invalid) do
            flash.now[:alert] = I18n.t("participatory_processes.create.error", scope: "decidim.admin")
            render :new
          end
        end
      end

      def edit
        @participatory_process = ParticipatoryProcess.find(params[:id])
        @form = ParticipatoryProcessForm.from_model(@participatory_process)
      end

      def update
        @participatory_process = ParticipatoryProcess.find(params[:id])
        @form = ParticipatoryProcessForm.from_params(params)

        UpdateParticipatoryProcess.call(@participatory_process, @form) do
          on(:ok) do
            flash[:notice] = I18n.t("participatory_processes.update.success", scope: "decidim.admin")
            redirect_to participatory_processes_path
          end

          on(:invalid) do
            flash.now[:alert] = I18n.t("participatory_processes.update.error", scope: "decidim.admin")
            render :edit
          end
        end
      end

      def show
        @participatory_process = ParticipatoryProcess.find(params[:id])
      end

      def destroy
        @participatory_process = ParticipatoryProcess.find(params[:id]).destroy!
        flash[:notice] = I18n.t("participatory_processes.destroy.success", scope: "decidim.admin")

        redirect_to participatory_processes_path
      end

      private

      def organization
        current_user.organization
      end
    end
  end
end
