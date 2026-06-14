# frozen_string_literal: true

module RuboCop
  module Cop
    module CustomCops
      class InclusiveDatetimeRange < Base
        MSG = '日時カラムへ終点を含む範囲指定 (`..`) を使っています。' \
              '月末などの境界が取りこぼされる恐れがあります。' \
              '終点を含まない `...` の利用を検討してください。'

        RESTRICT_ON_SEND = %i[where].freeze

        def_node_matcher :where_with_inclusive_range, <<~PATTERN
          (send _ :where (hash <(pair (sym $_) (irange _ _)) ...>))
        PATTERN

        def on_send(node)
          where_with_inclusive_range(node) do |column_name|
            next unless datetime_column?(column_name)

            add_offense(node)
          end
        end

        private

        def datetime_column?(name)
          name.to_s.end_with?('_at', '_on')
        end
      end
    end
  end
end
