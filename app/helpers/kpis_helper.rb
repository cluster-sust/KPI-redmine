require 'date'
module KpisHelper
        #find out project create and project end date difference in hour. assuming per day as 8 hours
        #startDate and dueDate must be Date Type
        def projectDuration(startDate,dueDate)
                return (dueDate.mjd - startDate.mjd) 
        end

        def projectTaskWeightcalculation#(project)
                pta  = []
                array = []
                value = 0
                point =0
                taskSet = Issue.where(project_id: @project.id,  tracker_id: 4)                
                taskSet.each do |individualTask|
                        if individualTask.parent_id?
                                pta << individualTask.parent_id
                        end
                end
                taskSet.reject { |s| pta.uniq.include? s.id  }
                taskSet.each do |t| 
                        #Rails.logger.info t.subject
                        #Rails.logger.info t.priority_id
                        #Rails.logger.info "done ratio"
                        value += (t.done_ratio * t.priority_id)
                        point += t.priority_id
                        #Rails.logger.info value  
                end 
                array << value
                array << point
                Rails.logger.info "value"
                Rails.logger.info taskSet    
                return array
        end

        def projectIssueWeightcalculation
                pta  = []
                array = []
                value = 0
                point =0
                taskSet = Issue.where(project_id: @project.id,  tracker_id: 5)
                taskSet.each do |individualTask|
                        if individualTask.parent_id?
                                pta << individualTask.parent_id
                        end
                end
                taskSet.reject { |s| pta.uniq.include? s.id  }
                taskSet.each do |t| 
                        #Rails.logger.info t.subject
                        #Rails.logger.info t.priority_id
                        #Rails.logger.info "done ratio"
                        value += (t.done_ratio * t.priority_id)
                        point += t.priority_id
                        #Rails.logger.info value  
                end 
                array << value
                array << point
                Rails.logger.info "value"
                Rails.logger.info taskSet    
                return array
        end
end