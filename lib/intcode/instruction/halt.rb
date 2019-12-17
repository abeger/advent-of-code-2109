# frozen_string_literal: true

require_relative 'base'

module Intcode
  module Instruction
    # End
    class Halt < Intcode::Instruction::Base
      def execute
        program
      end

      def opcode
        99
      end

      def num_params
        0
      end

      def next_command_addr
        nil
      end
    end
  end
end
