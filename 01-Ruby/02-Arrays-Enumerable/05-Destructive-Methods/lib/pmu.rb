def pmu_format!(race_array)
  # TODO: modify the given array so that it is PMU-consistent. This method should return nil.
  race_array.map! { |n| (race_array.index(n) + 1).to_s + "-" + n + "!" }.reverse!
end