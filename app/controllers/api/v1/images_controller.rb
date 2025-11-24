module Api
  module V1
    class ImagesController < ApplicationController
      # GET /api/v1/production_images
      def index
        images = [
          { id: 1, url: "https://images.unsplash.com/photo-1511732353404-7dffb0c9b2d6?auto=format&fit=crop&w=1400&q=80", caption: "Dried fruits selection on wooden table", tags: ["dried-fruits", "packing", "production"] },
          { id: 2, url: "https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=900&q=80", caption: "Assorted mixed nuts", tags: ["nuts", "mixed", "processing"] },
          { id: 3, url: "https://images.unsplash.com/photo-1551218808-94e220e084d2?auto=format&fit=crop&w=900&q=80", caption: "Dried apricots and figs in baskets", tags: ["dried-fruits", "sorting"] },
          { id: 4, url: "https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=900&q=80", caption: "Packaging station with sealed bags", tags: ["packaging", "factory"] },
          { id: 5, url: "https://images.unsplash.com/photo-1507750818765-4d7b5e9a4b78?auto=format&fit=crop&w=900&q=80", caption: "Large mixed fruit & nut pallet ready for export", tags: ["export", "logistics"] }
        ]

        render json: { images: images }, status: :ok
      end
    end
  end
end
