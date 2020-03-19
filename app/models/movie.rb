class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch::Model #include the Pgsearch code/module
  # pg_search_scope :you_can_name_this_method_how_you_want,
  # pg_search_scope :search_by_title_and_syllabus,
  #                 # search_by_column_names
  #   against: [ :title, :syllabus ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }

#   pg_search_scope :global_search_for_movies_directors,
#     against: [ :title, :syllabus ],
#     associated_against: {
#       director: [ :first_name, :last_name ]
#     },
#     using: {
#       tsearch: { prefix: true }
#     }
 multisearchable against: [:title, :syllabus]
end
