module ApplicationHelper
    def local_timezone datetime
        datetime.in_time_zone(TZInfo::Timezone.get('Asia/Kolkata')).to_formatted_s(:short)
    end    
end
