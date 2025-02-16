module Api
  module V1
    class FamilyCommandsController < ApplicationController
      def process_file
        unless params[:file].present?
          render json: { error: "No file provided" }, status: :bad_request
          return
        end

        # Create a temporary file to store the uploaded content
        temp_file = Tempfile.new([ "commands", ".txt" ])
        begin
          temp_file.write(params[:file].read)
          temp_file.rewind

          # Capture output from command processor
          output = []
          processor = FamilyCommandProcessor.new

          # Override puts in the processor to capture output
          processor.define_singleton_method(:puts) do |message|
            output << message
          end

          processor.process_file(temp_file.path)

          render json: { results: output }, status: :ok
        rescue => e
          render json: { error: e.message }, status: :internal_server_error
        ensure
          temp_file.close
          temp_file.unlink
        end
      end
    end
  end
end
