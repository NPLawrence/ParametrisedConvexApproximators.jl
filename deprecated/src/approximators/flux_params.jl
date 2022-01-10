Flux.params(nn::FNN) = Flux.params(nn.NN...)
# Flux.params(nn::PMA) = Flux.params(nn.NN...)
Flux.params(nn::PMA) = Flux.params(nn.NN1, nn.NN2)
# Flux.params(nn::PLSE) = Flux.params(nn.NN...)
Flux.params(nn::PLSE) = Flux.params(nn.NN1, nn.NN2)
Flux.params(normalised_approximator::NormalisedApproximator) = Flux.params(normalised_approximator.approximator)

number_of_params(nn::AbstractApproximator) = Flux.params(nn) |> Map(param -> prod(size(param))) |> sum
