class EquipmentsController < ApplicationController
  respond_to  :json,:html
  def rate
    @user = User.find_by_name(params[:name])
    if @user
      @equipment = @user.equipments.create(equip_id: params[:equip_id],rate: params[:rate])
      @equipment.save!
    end
    redirect_to  :action => :list
  end
  def xl824_rating
    @xl824_reviews = Equipment.where(equip_id: 'xl824').count
    @xl824_ratings = Equipment.where(equip_id: 'xl824').average(:rate)
  end
  def xl950_rating
    @xl950_reviews = Equipment.where(equip_id: 'xl950').count
    @xl950_ratings = Equipment.where(equip_id: 'xl950').average(:rate)
  end
  def xl20i_air_conditioner_rating
    @xl20i_air_conditioner_reviews = Equipment.where(equip_id: 'xl20iairconditioner').count
    @xl20i_air_conditioner_ratings = Equipment.where(equip_id: 'xl20iairconditioner').average(:rate)
  end
  def xc95m_gas_furnace_rating
    @xc95m_gas_furnace_reviews = Equipment.where(equip_id: 'xc95mgasfurnace').count
    @xc95m_gas_furnace_ratings = Equipment.where(equip_id: 'xc95mgasfurnace').average(:rate)
  end
  def humidifier_rating
    @humidifier_reviews = Equipment.where(equip_id: 'humidifier').count
    @humidifier_ratings = Equipment.where(equip_id: 'humidifier').average(:rate)
  end
  def aircleaner_rating
    @aircleaner_reviews = Equipment.where(equip_id: 'aircleaner').count
    @aircleaner_ratings = Equipment.where(equip_id: 'aircleaner').average(:rate)
  end
  def hyperion_air_handler_rating
    @hyperion_air_handler_reviews = Equipment.where(equip_id: 'hyperionairhandler').count
    @hyperion_air_handler_ratings = Equipment.where(equip_id: 'hyperionairhandler').average(:rate)
  end
  def user_rate
    @user = User.find_by_name(params[:name])
    @xl824_user_rate = validate_user_rate('xl824')
    @xl950_user_rate = validate_user_rate('xl950')
    @xl20i_air_conditioner_user_rate =validate_user_rate('xl20iairconditioner')
    @xc95m_gas_furnace_user_rate = validate_user_rate('xc95mgasfurnace')
    @humidifier_user_rate = validate_user_rate('humidifier')
    @aircleaner_user_rate = validate_user_rate('aircleaner')
    @hyperion_air_handler_user_rate = validate_user_rate('hyperionairhandler')
  end
  def details
    xl20i_air_conditioner_rating
    xc95m_gas_furnace_rating
    humidifier_rating
    aircleaner_rating
    hyperion_air_handler_rating
    xl950_rating
    xl824_rating
    user_rate
    respond_to do |format|
      msg = {
        "xl824" => {"overall_rating"=>@xl824_ratings,"total_reviews" => @xl824_reviews,"my_rating"=>@xl824_user_rate},
        "xl950" => {"overall_rating"=>@xl950_ratings,"total_reviews" => @xl950_reviews,"my_rating"=>@xl950_user_rate},
        "xl20iairconditioner" => {"overall_rating"=>@xl20i_air_conditioner_ratings,"total_reviews" => @xl20i_air_conditioner_reviews,"my_rating"=>@xl20i_air_conditioner_user_rate},
        "xc95mgasfurnace" => {"overall_rating"=>@xc95m_gas_furnace_ratings,"total_reviews" => @xc95m_gas_furnace_reviews,"my_rating"=>@xc95m_gas_furnace_user_rate},
        "humidifier" => {"overall_rating"=>@humidifier_ratings,"total_reviews" => @humidifier_reviews,"my_rating"=>@humidifier_user_rate},
        "aircleaner" => {"overall_rating"=>@aircleaner_ratings,"total_reviews" => @aircleaner_reviews,"my_rating"=>@aircleaner_user_rate},
        "hyperionairhandler" => {"overall_rating"=>@hyperion_air_handler_ratings,"total_reviews" => @hyperion_air_handler_reviews,"my_rating"=>@hyperion_air_handler_user_rate},
      }
      format.json  { render :json => msg }
    end
    #  respond_with(@thermostat_total_ratings,@thermostat_total_reviews,@indoor_total_ratings,@indoor_total_reviews,@outdoor_total_ratings,@outdoor_total_reviews) do |format|
    #    format.json { render }
    #  end
  end
  def list
    xl20i_air_conditioner_rating
    xc95m_gas_furnace_rating
    humidifier_rating
    aircleaner_rating
    hyperion_air_handler_rating
    xl950_rating
    xl824_rating
  end
  private
  def validate_user_rate(equip_id)
    ((record = @user.equipments.find_by_equip_id(equip_id)).nil?)? "" : record.rate
  end
end
