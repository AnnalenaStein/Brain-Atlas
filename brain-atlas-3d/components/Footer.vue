<template>
    <div class="footer-bar">
        <div class="footer-column">
            <h4 class="footer-title">🗂 Sources</h4>
            <div class="footer-entry">
                <div>Kandel, Schwartz & Jessell<br />McGraw-Hill</div>
                <a href="#">Neural mechanisms</a>
            </div>
            <div class="footer-entry">
                <div>Bear, Connors & Paradiso<br />Lippincott</div>
                <a href="#">Neuroscience: Exploring the Brain</a>
            </div>
        </div>

        <div class="footer-divider"></div>

        <div class="footer-column">
            <div class="footer-title-row">
                <h4 class="footer-title">🔗 Related Studies</h4>
            </div>
            <div class="footer-entry">
                <div>Rizzolatti et al.<br />PNAS, 1996</div>
                <a href="https://www.pnas.org/doi/10.1073/pnas.93.13.5499" target="_blank">Mirror Neurons and Action
                    Understanding</a>
            </div>
            <div class="footer-entry">
                <div>Jeannerod, M.<br />Neuropsychologia, 2001</div>
                <a href="https://doi.org/10.1016/S0028-3932(01)00129-5" target="_blank">Motor Cognition</a>
            </div>
            <div class="footer-entry">
                <div>Wise, S. P.<br />Annu Rev Neurosci, 1985</div>
                <a href="https://doi.org/10.1146/annurev.ne.08.030185.001425" target="_blank">The Premotor Cortex and
                    Nonstandard Sensorimotor Mapping</a>
            </div>
            <div class="footer-entry">
                <div>Cisek, P. & Kalaska, J. F.<br />Nat Rev Neurosci, 2010</div>
                <a href="https://doi.org/10.1038/nrn2798" target="_blank">Neural Mechanisms for Interacting with a World
                    Full of Action Choices</a>
            </div>
            <div class="footer-entry">
                <div>Grezes & Decety<br />Hum Brain Mapp, 2001</div>
                <a href="https://doi.org/10.1002/hbm.1049" target="_blank">Functional Anatomy of Execution, Mental
                    Simulation, Observation, and Verbalization of Action</a>
            </div>
        </div>

        <div class="footer-divider"></div>

        <div class="footer-column wide">
            <div class="footer-title-row">
                <h4 class="footer-title">📝 Notes</h4>
                <div style="display: flex; gap: 8px;">
                    <button class="footer-button small">Generate Summary</button>
                    <button class="footer-button small">View all Notes</button>
                </div>
            </div>
            <div class="notes-scroll">
                <p><strong>Note in <a href="/atlas" style="text-decoration: underline; color: #60a5fa;">Motor
                            Region</a></strong></p>
                <p>
                    Hand movement involves a coordinated motor network. Key regions include the primary motor cortex (M1)
                    for initiating movement, the supplementary motor area (SMA) for planning, and the premotor cortex (PMC)
                    for action preparation. The somatosensory cortex provides feedback, while the cerebellum refines timing
                    and precision.
                </p> <br>
                <p>
                    In goal-directed tasks like grasping, parietal regions help integrate spatial and visual information.
                    Studies show that disruptions in this network, especially between SMA and M1, are linked to motor
                    disorders such as Parkinson’s.
                </p>
                <br>
                <p><strong>Note in <a href="/atlas" style="text-decoration: underline; color: #60a5fa;">Basal
                            Ganglia</a></strong></p>
                <p>
                    The basal ganglia play a critical role in action selection and initiation of voluntary movement. They
                    act as a gatekeeper, filtering potential motor actions from the cortex and allowing only the most
                    contextually appropriate ones to proceed. Disruptions in this network are associated with disorders like
                    Parkinson’s (hypokinesia) and Huntington’s (hyperkinesia), highlighting its modulatory function.


                </p> <br>
            </div>
        </div>

        <div class="footer-divider"></div>

        <div class="footer-column" style="flex: 0.7">
            <h4 class="footer-title">📤 Export</h4>
            <button class="footer-button">Export</button>
        </div>
    </div>
</template>
  
<style scoped> 
.footer-bar {
  display: flex;
  justify-content: space-between;
  background: #1e1e1e;
  padding: 24px;
  margin-top: 100px;
  border-top: 1px solid var(--border-light);
  color: var(--text-body);
  font-family: Inter, sans-serif;
  gap: 16px;
}

.footer-column {
  display: flex;
  flex-direction: column;
  gap: 12px;
  flex: 1;
  padding: 0 8px;
  min-width: 160px;
}

.footer-column.wide {
  flex: 2;
}

.footer-title-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 12px;
}

.footer-title {
  font-size: 14px;
  font-weight: 600;
  color: var(--text-label);
}

.footer-entry {
  font-size: 13px;
  color: var(--text-muted);
}

.footer-entry a {
  color: #60a5fa;
  text-decoration: underline;
  font-size: 13px;
}

.footer-button {
  background: var(--bg-tag);
  border: 1px solid var(--border-light);
  color: var(--text-body);
  padding: 6px 12px;
  border-radius: 6px;
  font-size: 13px;
  cursor: pointer;
}

.footer-button.small {
  padding: 4px 8px;
  font-size: 12px;
}

.footer-button:hover {
  background: var(--bg-tag-hover);
}

.footer-divider {
  width: 1px;
  background: var(--border-light);
  margin: 0 8px;
}

.notes-scroll {
  overflow-y: auto;
  padding-right: 8px;
  margin-bottom: 0;
}

.notes-scroll p {
  font-size: 14px;
  line-height: 1.5;
  color: var(--text-body);
}


</style>
  