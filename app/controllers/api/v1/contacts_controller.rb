module Api
  module V1
    class ContactsController < ApplicationController
      # Accept form and JSON requests. Keep CSRF verification for regular form posts.
      protect_from_forgery with: :exception

      def create
        name = params[:name].to_s.strip
        email = params[:email].to_s.strip
        phone = params[:phone].to_s.strip
        message = params[:message].to_s.strip

        if name.blank? || email.blank? || message.blank?
          render json: { error: 'name, email and message are required' }, status: :unprocessable_entity
          return
        end

        # Send email using ContactMailer
        begin
          ContactMailer.with(name: name, email: email, phone: phone, message: message).submission_email.deliver_later
        rescue => e
          # fallback to deliver_now if background jobs are not configured
          begin
            ContactMailer.with(name: name, email: email, phone: phone, message: message).submission_email.deliver_now
          rescue => mail_err
            Rails.logger.error "Contact mail failed: #{mail_err.message}"
            render json: { error: 'Failed to send email' }, status: :internal_server_error
            return
          end
        end

        respond_to do |format|
          format.json { render json: { success: true, message: 'Message sent' }, status: :ok }
          format.html { redirect_to contact_path, notice: 'Your message has been sent. We will contact you shortly.' }
        end
      end
    end
  end
end
