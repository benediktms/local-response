export const addDirections = data => {
  const estimation = document.getElementById('estimation');
  const directions = document.getElementById('directions');
  const steps = data.routes[0].legs[0].steps;
  const duration = data.routes[0].duration;
  const instructions = [];

  steps.forEach(step => {
    instructions.push(`<li>${step.maneuver.instruction}</li>`);
    estimation.innerHTML = `<h3>Trip duration: ${Math.floor(
      duration / 60
    )} min</h3>`;
  });
  instructions.forEach(instruction => {
    directions.insertAdjacentHTML('beforeend', instruction);
  });
};
