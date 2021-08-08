import { CaseReducer, PayloadAction } from "@reduxjs/toolkit";
import { InventoryProps, ItemProps } from "../typings";
import { InventoryState } from "../store/inventorySlice";

export const refreshSlots: CaseReducer<
  InventoryState,
  PayloadAction<
    {
      item: ItemProps;
      inventory: InventoryProps["type"];
    }[]
  >
> = (state, action) => {
  state.isBusy = true;
  action.payload.forEach((data) => {
    const inventory =
      data.inventory === undefined
        ? state.playerInventory
        : state.rightInventory;

    inventory.items[data.item.slot - 1] = data.item;
  });
  state.isBusy = false;
};
