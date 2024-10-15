document.addEventListener('DOMContentLoaded', () => {
    const taskCheckboxes = document.querySelectorAll('.task-checkbox');
  
    taskCheckboxes.forEach(checkbox => {
      checkbox.addEventListener('change', (event) => {
        const taskId = event.target.dataset.taskId;
        const isChecked = event.target.checked;
  
        fetch(`/tasks/${taskId}/complete`, {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('[name=csrf-token]').content
          },
          body: JSON.stringify({ task: { completed: isChecked } })
        })
        .then(response => response.json())
        .then(data => {
          if (data.success) {
            console.log('Tarefa arquivada!');
          } else {
            console.log('Erro ao arquivar a tarefa.');
          }
        });
      });
    });
  });
  