import { ethers } from "hardhat";
import { BarretenbergBackend } from "@noir-lang/backend_barretenberg";
import { Noir } from "@noir-lang/noir_js";
import multiplier from "../circuits/multiplier/target/multiplier.json";

async function main() {
  const circuit: any = multiplier;
  const backend = new BarretenbergBackend(circuit);
  const noir = new Noir(circuit, backend);
  const input = { x: 1, y: 2 };

  let proof = await noir.generateFinalProof(input);
  const verification = await noir.verifyFinalProof(proof);

  console.log(verification);

  process.exit(0);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
