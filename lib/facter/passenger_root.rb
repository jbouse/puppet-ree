Facter.add(:passenger_root) do
  setcode do
    %x{passenger-config --root}.chomp
  end
end
