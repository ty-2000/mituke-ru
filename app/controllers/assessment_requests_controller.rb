class AssessmentRequestsController< ApplicationController

    def thx
    end

    def new
      @assessment_request= AssessmentRequest.new
      @shop = Shop.find(params[:shop_id])
    end
  
    def create
      @assessment_request= AssessmentRequest.new(assessment_request_params)
      @shop = Shop.find(@assessment_request.branch_id)
      if @assessment_request.valid?
        # API を叩く処理
        redirect_to assessment_requests_success_path
      else
        flash[:error_messages] = @assessment_request.errors.full_messages
        render 'new', status: :unprocessable_entity
      end
    end
  
    private
    def assessment_request_params
      params.require(:assessment_request).permit(
          :branch_id, 
          :property_city, 
          :property_address, 
          :property_type, 
          :property_exclusive_area, 
          :property_land_area, 
          :property_building_area, 
          :property_building_area_unit, 
          :property_floor_area, 
          :url_param, 
          :property_room_plan, 
          :property_constructed_year, 
          :user_email, 
          :user_name, 
          :user_name_kana, 
          :user_tel)
    end
  end